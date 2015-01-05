require 'opal/slim'

# Don't use the nested describe, so we don't accidentally use the ::Slim module
describe Opal::Slim do
  it 'compiles a plain Slim template' do
    template = 'p lol'
    compiled = ::Opal::Slim.compiled_slim(template)
    expect(compiled).to eq %Q{_buf = []; _buf << (\"<p>lol</p>\".freeze); \n; _buf = _buf.join}
  end

  it 'compiles a Slim template with evaluated code' do
    template = '= link_to "hi"'
    compiled = ::Opal::Slim.compiled_slim(template)
    expect(compiled).to eq %Q{_buf = []; _buf << (::Temple::Utils.escape_html((link_to "hi"))); \n; _buf = _buf.join}
  end

  it 'wraps a Slim template in a Template block' do
    template = '<compiled slim>'
    expected = <<-EOF
        Template.new('(slim)') do |slim|
          <compiled slim>
        end
    EOF

    compiled = ::Opal::Slim.wrap(template, '(slim)')
    expect(compiled).to eq expected
  end
end
