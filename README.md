# cc-Commander
The cc Commander is a suite of shell scripts designed to streamline the daily development tasks associated with the CoreMedia CMS. This toolkit simplifies the complexities of routine operations, enhancing efficiency and productivity for developers working with CoreMedia.

Features: 

Build modules & run containers with a short command, eg. ccDockerBuildManagementToolsAndRun	

Usage:
ccD<tab>B<tab>M<tab>A<tab>

Toggle skipTests with a simple command: skipTests

## Here is a detailed description of each function and alias:

## Environment Variables
CM_HOME: Sets the directory of the CoreMedia project.

SKIP_TESTS: Controls whether tests should be skipped during the build process.

SKIP_INFO: Controls whether information should be displayed when executing commands.


## Functions
cc_info(): Displays information about the current configuration and versions of Java, pnpm, and Maven.

skipTests(): Toggles the SKIP_TESTS variable between true and false and displays the current status.


## Aliases
ccHome: Displays the current CM_HOME directory.

ccOOverview: Opens the Docker overview page in the browser.

ccOStudio: Opens the Studio page in the browser.

ccOStudioLocal: Opens the local Studio page in the browser.

ccOTraefik: Opens the Traefik dashboard in the browser.

ccCleanStudio: Changes to the Studio Client directory, cleans, and installs dependencies.


## Build Functions
ccBuildAll(): Builds all projects in the CM_HOME directory.

ccBuildAllWithImages(): Builds all projects and Docker images in the CM_HOME directory.

ccBuildStudioClient(): Builds the Studio Client.

ccDockerBuildStudioClient(): Builds the Studio Client and creates a Docker image.

ccDockerBuildAndRunAll(): Builds all projects and Docker images and starts all containers.

ccBuildStudioClientAndRunLocal(): Builds the Studio Client and starts it locally.

ccDockerBuildStudioClientAndRun(): Builds the Studio Client and starts the container.

ccDockerRunAll(): Starts all Docker containers.


## Module and Container Functions
buildModule(): Builds a specific module and its dependencies.

runContainer(): Starts a specific Docker container.


## Specific Build and Run Functions
ccDockerBuildCaePreview(): Builds the cae-preview-app module.

ccDockerBuildCaePreviewAndRun(): Builds and starts the cae-preview-app module.

ccDockerBuildCaeLive(): Builds the cae-live-app module.

ccDockerBuildCaeLiveAndRun(): Builds and starts the cae-live-app module.

ccDockerBuildHeadlessPreview(): Builds the headless-server-app module.

ccDockerBuildHeadlessPreviewAndRun(): Builds and starts the headless-server-preview module.

ccDockerBuildHeadlessLive(): Builds the headless-server-app module.

ccDockerBuildHeadlessLiveAndRun(): Builds and starts the headless-server-live module.

ccDockerBuildStudioServer(): Builds the studio-server-app module.

ccDockerBuildStudioServerAndRun(): Builds and starts the studio-server module.

ccDockerBuildContentServer(): Builds the content-server-app module.

ccDockerBuildContentServerAndRun(): Builds and starts the content-management-server module.

ccDockerBuildCaeFeederLive(): Builds the cae-feeder-app module.

ccDockerBuildCaeFeederLiveAndRun(): Builds and starts the cae-feeder-live module.

ccDockerBuildCaeFeederPreview(): Builds the cae-feeder-app module.

ccDockerBuildCaeFeederPreviewAndRun(): Builds and starts the cae-feeder-preview module.

ccDockerBuildManagementTools(): Builds the management-tools.blueprint-container-image module.

ccDockerBuildManagementToolsAndRun(): Builds and starts the management-tools module.
