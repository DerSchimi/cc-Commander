################################################
# cc Commander v0.1
# Features: 
# - Build modules & run containers with a short command, eg. ccDockerBuildManagementToolsAndRun	
# - Toggle skipTests with a simple command: skipTests
#
# Tested with cmcc-2310.3 and cmcc-2406.x
#
# Instructions:
# Copy ccCommander.sh to your home directory
# Set CM_HOME inside this file to your CoreMedia 12 or 11 directory
# Add this line to your shell rc file, eg. .zshrc
# source ~/ccCommander.sh
# Reload your shell, eg. zsh
# type cc + <TAB> to see all commands
#
#
# Contact: https://github.com/DerSchimi/cc-Commander


#export CM_HOME='/Users/<username>/projects/cm11workspace'
export CM_HOME='/Users/<username>/projects/cm12workspace'

export SKIP_TESTS=false
export SKIP_INFO=false

function cc_info(){
	if [ "$SKIP_INFO" != "true" ]; 
		then echo "cc-Commander v0.1\nhttps://github.com/DerSchimi/cc-Commander\nUsing cm-home:$CM_HOME\nskipTests:$SKIP_TESTS\nJava:`java --version`\npnpm:`pnpm -v`\nMaven:\n`mvn -v`"
	else echo "cc-Commander v0.1";
	
	fi;
}

function skipTests() {
	if [ "$SKIP_TESTS" = "true" ]; 
		then export SKIP_TESTS=false; 
	else export SKIP_TESTS=true; 
	fi; 
	echo "SKIP_TESTS is now set to $SKIP_TESTS"
}

alias ccHome='echo Home is: $CM_HOME'
alias ccOOverview='open https://overview.docker.localhost/'
alias ccOStudio='open https://studio.docker.localhost/'
alias ccOStudioLocal='open http://localhost:3000'
alias ccOTraefik='open https://monitor.docker.localhost/dashboard/#/'
alias ccCleanStudio='cd $CM_HOME/apps/studio-client/ && pnpm -r clean && pnpm install'


function ccBuildAll(){
	cc_info;
	cd $CM_HOME && mvn clean install -DskipTests=$SKIP_TESTS
}

function ccBuildAllWithImages(){
	cc_info;
	cd $CM_HOME && mvn clean install -DskipTests=$SKIP_TESTS -Pdefault-image
}

function ccBuildStudioClient(){
    cc_info;
    cd $CM_HOME/apps/studio-client/ && pnpm -r run build
}

function ccDockerBuildStudioClient(){
	ccBuildStudioClient && pnpm -r run package && docker buildx build . --tag coremedia/studio-client:latest	
}

function ccDockerBuildAndRunAll(){
	cc_info;	
	cd $CM_HOME && mvn clean install -DskipTests=$SKIP_TESTS -Pdefault-image && ccDockerBuildStudioClient && cd $CM_HOME && cd global/deployment/docker && docker compose up -d --force-recreate
}

function ccBuildStudioClientAndRunLocal(){
	cc_info;
	ccBuildStudioClient && cd global/studio && pnpm run start --proxyTargetUri=http://studio.docker.localhost
}

function ccDockerBuildStudioClientAndRun(){
	ccDockerBuildStudioClient && cd $CM_HOME/global/deployment/docker && docker compose up -d studio-client
}

function ccDockerRunAll(){
	cc_info;
	cd $CM_HOME/global/deployment/docker && docker compose up --force-recreate -d
}

function buildModule(){
	cd $CM_HOME && mvn clean install -T 1.5C -DskipTests=$SKIP_TESTS -pl :$1 -am -P default-image
}

functio runContainer(){
	cd $CM_HOME/global/deployment/docker && docker compose up -d $1 --force-recreate
}

function ccDockerBuildCaePreview(){
  cc_info;
  buildModule "cae-preview-app"
}

function ccDockerBuildCaePreviewAndRun(){
  ccDockerBuildCaePreview;
  runContainer "cae-preview"
}

function ccDockerBuildCaeLive(){
  cc_info;
  buildModule "cae-live-app"
}

function ccDockerBuildCaeLiveAndRun(){
  ccDockerBuildCaeLive;
  runContainer "cae-live"
}

function ccDockerBuildHeadlessPreview(){
  cc_info;
  buildModule "headless-server-app"
}

function ccDockerBuildHeadlessPreviewAndRun(){
  ccDockerBuildHeadlessPreview
  runContainer "headless-server-preview"
}

function ccDockerBuildHeadlessLive(){
  cc_info;
  buildModule "headless-server-app"
}

function ccDockerBuildHeadlessLiveAndRun(){
  ccDockerBuildHeadlessLive
  runContainer "headless-server-live"
}

function ccDockerBuildStudioServer(){
  cc_info;
  buildModule "studio-server-app"
}

function ccDockerBuildStudioServerAndRun(){
  ccDockerBuildStudioServer
  runContainer "studio-server"
}

function ccDockerBuildContentServer(){
  cc_info;
  buildModule "content-server-app"
}

function ccDockerBuildContentServerAndRun(){
  ccDockerBuildContentServer
  runContainer "content-management-server"
}

function ccDockerBuildCaeFeederLive(){
  cc_info;
  buildModule "cae-feeder-app"
}

function ccDockerBuildCaeFeederLiveAndRun(){
  ccDockerBuildCaeFeederLive
  runContainer "cae-feeder-live"
}

function ccDockerBuildCaeFeederPreview(){
  cc_info;
  buildModule "cae-feeder-app"
}

function ccDockerBuildCaeFeederPreviewAndRun(){
  ccDockerBuildCaeFeederPreview
  runContainer "cae-feeder-preview"
}

function ccDockerBuildManagementTools(){
  cc_info;
  buildModule "management-tools.blueprint-container-image"
}

function ccDockerBuildManagementToolsAndRun(){
	ccDockerBuildManagementTools
  runContainer "management-tools"
}
