local config = {
  cmd = { '/home/gvu/jdtls/bin/jdtls' },
  root_dir = vim.fs.dirname(vim.fs.find({ 'gradlew', '.git', 'mvnw' }, { upward = true })[1]),
  init_options = {
    bundles = {},
  },
}

local bundles = {
  vim.fn.glob('/home/gvu/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar', true),
}
vim.list_extend(bundles, vim.split(vim.fn.glob('/home/gvu/vscode-java-test/server/*.jar', true), '\n'))
config['init_options'] = {
  bundles = bundles,
}

require('jdtls').start_or_attach(config)
