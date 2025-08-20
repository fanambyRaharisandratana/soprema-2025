const esbuild = require("esbuild");
const sassPlugin = require("esbuild-sass-plugin").sassPlugin;

esbuild.build({
  entryPoints: ["js/app.js", "css/app.scss"],
  bundle: true,
  outdir: "../priv/static/assets",
  plugins: [sassPlugin()],
  target: "es2017",
}).catch(() => process.exit(1));
