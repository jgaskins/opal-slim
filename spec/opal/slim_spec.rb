require 'opal/slim'

# Don't use the nested describe, so we don't accidentally use the ::Slim module
describe Opal::Slim do
  it 'compiles a plain Slim template' do
    template = 'p lol'
    compiled = ::Opal::Slim.compiled_slim(template)
    expect(compiled).to eq %Q{_buf = ("<p>lol</p>"\\\n"").to_s}
  end

  it 'compiles a Slim template with evaluated code' do
    template = '= link_to "hi"'
    compiled = ::Opal::Slim.compiled_slim(template)
    expect(compiled).to eq %Q{_buf = []; _buf << (::ERB::Util.html_escape((link_to "hi"))); \n; _buf = _buf.join}
  end

  it 'wraps a Slim template in a Template block' do
    expected = <<-EOF
        Template.new('(slim)') do |slim|
          _buf = ("<p>lol</p>"\\\n"").to_s
        end
    EOF

    template = 'p lol'
    compiled = ::Opal::Slim.wrap(template, '(slim)')
    expect(compiled).to eq expected
  end
end
