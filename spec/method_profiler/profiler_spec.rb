require 'spec_helper'

describe MethodProfiler::Profiler do
  let!(:profiler) { described_class.new(Petition) }
  let(:petition) { Petition.new }

  it "creates wrapper methods for the object's methods" do
    petition.should respond_to(:foo)
    petition.should respond_to(:foo_with_profiling)
    petition.should respond_to(:foo_without_profiling)
    petition.should_not respond_to(:foo_with_profiling_with_profiling)
  end

  describe "#report" do
    it "returns a new Report object" do
      profiler.report.should be_an_instance_of MethodProfiler::Report
    end
  end
end
