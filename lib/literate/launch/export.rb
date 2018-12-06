# frozen_string_literal: true

require 'json'
require 'yaml'

module Literate
  module Launch
    module Export
      # Build a Ruby data structure (Plain Old Ruby Objet) containing the
      # exportable data for this resource.
      def self.to_poro(resource)
        h = {
          id: resource.id,
          type: resource.type_of,
          attributes: resource.attributes,
          relationship_ids: relationship_ids(resource),
          meta: resource.meta,
        }.transform_keys(&:to_s)
        h
      end

      # Extract the IDs of all the related resources.
      def self.relationship_ids(resource)
        resource.relationships.each_with_object({}) do |(k, v), memo|
          objs = resource.send(k)
          memo[k] = k =~ /s$/ ? objs.map(&:id) : objs.id
        end
      end

      # Generate the JSON-formatted export of this Resource.
      def self.as_json(id)
        data = to_poro(Literate::Launch.load_resource(id))
        require 'json'
        JSON.pretty_generate([data])
      end

      # Generate the YAML-formatted export of this Resource.
      def self.as_yaml(id)
        data = to_poro(Literate::Launch.load_resource(id))
        require 'yaml'
        YAML.dump([data])
      end

      # Create a list of all the objects that should be exported.
      def self.extract_exportable_objects(id)
        root = load_resource(id)
        [to_poro(root)]
      end
    end
  end
end
