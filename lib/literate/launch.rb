# frozen_string_literal: true

require 'adobe/reactor'
require 'literate/launch/version'
require 'literate/launch/export'

module Literate
  # Methods for accessing data in Adobe Experience Platform Launch.
  module Launch
    class Error < StandardError; end

    TYPECODE_TO_CLASS = {
      'CO' => Adobe::Reactor::Company,
      'PR' => Adobe::Reactor::Property,
      'LB' => Adobe::Reactor::Library,
      'RL' => Adobe::Reactor::Rule,
      'RC' => Adobe::Reactor::RuleComponent,
      'DE' => Adobe::Reactor::DataElement,
      'EN' => Adobe::Reactor::Environment,
      'AD' => Adobe::Reactor::Adapter,
      'EX' => Adobe::Reactor::Extension,
    }.freeze

    # When exporting a resource, related resources are also serialized --
    # but only if their "resource level" is greater than that of the initial
    # resource.
    TYPECODE_TO_RESOURCE_LEVEL = {
      'CO' => 1,
      'PR' => 2,
      'LB' => 3,
      'RL' => 4,
      'RC' => 5,
      'DE' => 6,
      'EN' => 7,
      'AD' => 8,
      'EX' => 9,
    }.freeze

    # Return the class of the identified resource.
    def self.id_to_class(id)
      typecode = id[0..1]
      TYPECODE_TO_CLASS[typecode] ||
        die(Literate::Launch::Error.new(
              "id_to_class() is unimplemented for class '#{type_code}'"
            ))
    end

    # Return the resource level of the identified resource.
    def self.resource_level(id)
      typecode = id[0..1]
      TYPECODE_TO_RESOURCE_LEVEL[typecode] ||
        die(Literate::Launch::Error.new(
              "resource_level() is unimplemented for class '#{type_code}'"
            ))
    end

    # Return an object representing the identified Launch resource.
    # The object type is determined by the first two letters of the ID, which
    # are a type-specific code.
    def self.load_resource(id)
      id_to_class(id).get(id)
    end
  end
end
