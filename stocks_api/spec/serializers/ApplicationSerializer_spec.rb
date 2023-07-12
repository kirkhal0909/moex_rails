require 'rails_helper'

describe ApplicationSerializer do
  class ChildApplicationSerializer < ApplicationSerializer
    attributes :exists, :not_exists, :changed, :deep_changed, :static

    def changed
      object[:parse]
    end

    def deep_changed
      object.dig(:deep, :deep_value)
    end

    def static
      '10.10.1999'
    end
  end

  subject(:serializer) { ChildApplicationSerializer.new(data) }

  let(:data) { data_template }

  let(:data_template) do
    {
      exists: 'exists value',
      parse: true,
      deep: { deep_value: 69 }
    }
  end

  let(:expected_data) do
    {
      exists: 'exists value',
      not_exists: nil,
      changed: true,
      deep_changed: 69,
      static: '10.10.1999'
    }
  end

  describe 'to_hash' do
    it { expect(serializer.to_hash).to eq(expected_data) }

    context 'data in array' do
      let(:data) { [data_template, data_template] }

      it { expect(serializer.to_hash).to eq([expected_data, expected_data]) }
    end
  end

  describe 'to_json' do
    it { expect(serializer.to_json).to eq(expected_data.to_json) }
  end

  describe 'as_json' do
    it { expect(serializer.as_json).to eq(expected_data.as_json) }
  end
end
