# Unit01 Environment Set Up

## Introduction
This module shows how to set up the tools needed to do the rest of the units. You may not need all of the tools - for example, you may need Java but not Python. The two main tools are Copilot, discussed in Part 1, and VS Code, discussed in Part 2. Note that IDE's other than VS Code - for example, IntelliJ or PyCharm, can be set up to use Copilot, but those are not covered here.

## Use Case
Setting up your local environment correctly is required to run the code in the units and to complete the exercises.

## Part 1 Copilot Set Up

- If you don't have a GitHub account, create one.
- Enter the [GitHub Education](https://github.com/education/students) page to register for GitHub Education benefits, which will contain free access to Copilot.
- If you're not a student, use the free trial instead.

## Part 2 VS Code Set Up

### Step 1. Download and Open VS Code

- Download VS Code from [VS Code Website](https://code.visualstudio.com). Be sure to download the version for your computer.

### Step 2. Install Copilot Extension

- Click the gear icon in the bottom left corner and select the `Extensions` option from the menu.
- Type `copilot` in the search box and click the search button.
- Install the `GitHub Copilot` Extension at the top of the search result.
- Click the `Sign in to GitHub` button that pop-up from the bottom right corner, or click the face icon in the bottom left corner, and there should be a `Sign in with GitHub to use GitHub Copilot(1)` option.
- Click it and sign in with the GitHub account you prepared before, and it will lead us back to VS Code. After that, you are ready to use Copilot.

## Part 3 Java and JUnit Set Up

### Step 1. Set Up the Java Environment

There are many versions of the Java JDK available. We recommend using either v17 or v21, the latest Long-Term Support versions (even though there are more recent updates). Installation instructions for the JDK depend on the kind of machine you have, either MacOS or Windows.

Download a proper version of Java from [Oracle Java](https://www.oracle.com/java/technologies/downloads/#java21) that fits your computer.

For MacOS:

- You can use either the `ARM64 DMG Installer` or the `x64 DMG Installer`, depending on the kind of processor in your MacOS device.

- Download the `dmg` file and open it.

- Click the `JDK xxx.pkg` icon and there will be a pop-up window to guide you to install Java.

- Click all the continue and install button to finish the installation.


For Windows:

- Download the x64 Installer on the JDK 21 download page. Open it by double clicking its icon.

- Follow the installer's instructions.

After installation, you can run the following command in your terminal.
  ```
  java -version
  ```

  If the following information comes up, the installation is successful (but note that the version number may be different; if you used JDK 21, it will say that, not 17).

  ```
  java version "17.0.11" 2024-04-16 LTS
  Java(TM) SE Runtime Environment (build 17.0.11+7-LTS-207)
  Java HotSpot(TM) 64-Bit Server VM (build 17.0.11+7-LTS-207, mixed mode, sharing)
  ```

### Step 2. Install the Java Extension on VS Code

- Click the gear icon in the bottom left corner and select the `Extensions` option from the menu.
- Type `java` in the search box and click the search button.
- Choose and install the first option: `Extension Pack for Java`
- After installation, click the file icon on the top left corner. There should be a `Create Java Project` option.

### Step 3. Set Up Maven Environment

For the later modules that require other software besides the basic Java environment, you'll need to use Maven, a build tool that downloads dependent modules.

- Click the `Create Java Project` button.

- Choose `Maven` option , `maven-archetype-quickstart` as archetype, and `1.4` version

- The group ID should be `com.example` and the artifact ID should be `demo`.

- Select the destination folder.

- Then there will be a lot of downloads in a pop-up window. After that, the window will stop at

  ```
  Define value for property 'version' 1.0-SNAPSHOT: :
  ```

  Press enter without entering anything, the window will stop at

  ```
  Confirm properties configuration:
  groupId: com.example
  artifactId: demo
  version: 1.0-SNAPSHOT
  package: com.example
   Y: :
  ```

  Enter `y` or `Y`, and press enter. Click the `Open` option from the window pop-up. The file structure should be

  ```
  > src
  > target
  > pom.xml
  ```

### Step 4. Modify pom.xml File

Maven keeps track of dependent libraries in the pom.xml file, which uses a very specific format for naming those dependencies. When needed (for example, when working on the unit that uses GSON), you'll need to manually edit the pom file. The following describes the changes needed for junit support (the unit testing environment).

- Open the `pom.xml` file and change the following content

  ```
  <dependencies>
    <dependency>
      <groupId>junit</groupId>
      <artifactId>junit</artifactId>
      <version>4.11</version>
      <scope>test</scope>
    </dependency>
  </dependencies>
  ```

  to the following:

  ```
  <dependencyManagement>
    <dependencies>
      <dependency>
        <groupId>org.junit</groupId>
        <artifactId>junit-bom</artifactId>
        <version>5.10.2</version>
        <type>pom</type>
        <scope>import</scope>
      </dependency>
    </dependencies>
  </dependencyManagement>

  <dependencies>
    <dependency>
      <groupId>org.junit.jupiter</groupId>
      <artifactId>junit-jupiter</artifactId>
      <scope>test</scope>
    </dependency>
  </dependencies>
  ```

  Press `Command+S`(MacOS) or `Control+S`(Windows) to save the changes. Click the Maven tab in the Explorer. Select the `Reload All Maven Project` option at the top of the tab.

### Step 5. Create Test Class

- Enter the name of the Java file you want to create. Right-click on the blank area. Click `Source Action` option and choose `Generate Tests`
- Modify your target test class name and press enter.
- Select all the methods you want to test and click `OK`.
- VS Code will create a test class file for you.

## Part 4 Python and Pytest Set Up

### Step 1. Set Up Python Environment

For MacOS:

- Download a proper version of Python from [Python org](https://www.python.org/downloads) and open it. In this example, we are using python 3.12 (although there are more current versions).

- After clicking continue and agree, install Python into your computer.

- Open a terminal (MacOS) and run the following command:

  ```
  vim ~/.bash_profile
  ```

- It will open a file, press `i` on the keyboard and enter the following content:

  ```
  export PATH=${PATH}:/Library/Frameworks/Python.framework/Versions/3.12/bin
  alias python="/Library/Frameworks/Python.framework/Versions/3.10/bin/python3.12"
  ```

  Press `Esc` on the keyboard and press `:` on the keyboard, enter `wq` to save the change and exit the editor.

- Run the following command in the terminal:

  ```
  python --version
  ```

  If the following content shows in the terminal, the installation was successful.

  ```
  Python 3.12.4
  ```

  For Windows:

  - Download the Windows 64-bit installer from https://www.python.org/downloads/windows/.

  - Double-click the installer icon and follow its directions.

  - Open a CMD window and run the following command:

    ```
    python --version
    ```

    If the following content shows in the terminal, the installation was successful.

    ```
    Python 3.12.4
    ```

### Step 2. Install Python Extension on VS Code

- Click the gear icon in the bottom left corner and select the `Extensions` option from the menu.
- Type `python` in the search box and click the search button.
- Choose and install the `Python` Extension. There should be a `Testing` tab on the left-hand side.
- Click `Configure Python Tests` and choose `pytest` and `.` as the root directory.
- Now you can write the test class with the file name start with `test_` or end with `_test`. You can see all your test methods in the `Testing` tab on the left-hand side. These test methods should be named `test_xxx`.

### Step 3. Install Pytest

- Open a terminal tab in VS Code and enter the following command:

  ```
  python -m pip install pytest
  ```

or

  ```
  pip install pytest
  ```
