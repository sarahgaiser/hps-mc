/**
 * @mainpage Heavy Photon Search Toolkit for Reconstruction
 * 
 * The code base can be found at <a href="https://github.com/JeffersonLab/hpstr">https://github.com/JeffersonLab/hpstr</a>.
 * 
 * @par 
 * Any questions can be directed to <a href="mailto:bravo@slac.stanford.edu">Cameron Bravo</a>.
 * 
 * @section install Installation
 * For more information on how to install hpstr than what is presented here, please refer to the <a href="https://github.com/JeffersonLab/hps-mc/blob/master/README.md">hps-mc README</a>.
 * 
 * @subsection prerec Prerequisites
 * - wget
 * - git
 * - gcc >= 4.8
 * - CMake >= 3.18
 * - Maven >= 3.0
 * - python >= 3.6
 * - Java = 1.8
 * - GSL = 1.16
 * - Python libraries
 *   - psutil
 *   - jinja2
 * - <a href="https://github.com/slaclab/slic">SLIC</a>
 * - for some scripts: <a href="https://github.com/JeffersonLab/hps-dst">DST Maker</a>
 * 
 * @subsection steps Installation Steps
 * To build the project:
 * ```bash
 * cd hps-mc; mkdir build; cd build
 * cmake -DCMAKE_INSTALL_PREFIX=../install -DGSL_ROOT_DIR=$GSL_ROOT_DIR ..
 * make install
 * ```
 * The `GSL_ROOT_DIR` variable should be set to the GSL installation prefix which was used when you configured it (directory should contain the directories bin, include, etc.).
 * 
 * To build with additional external dependencies installed automatically:
 * ```bash
 * cmake -DCMAKE_INSTALL_PREFIX=$(realpath ../install) -DGSL_ROOT_DIR=/work/slac/sw/gsl/gsl-1.16-install/ -DENABLE_INSTALL_GENERATORS=ON -DENABLE_INSTALL_FIELDMAPS=ON -DENABLE_INSTALL_LCIO=ON -DENABLE_INSTALL_HPSJAVA=ON -DENABLE_INSTALL_CONDITIONS=ON ..
 * ```
 * 
 * This should install all of the tools to `hps-mc/install`.
 * Change `CMAKE_INSTALL_PREFIX` above if you wish to install to a different directory.
 * 
 * @subsection setup Environment Setup
 * - bash environment setup script:
 *   ```bash
 *   . hps-mc/install/bin/hps-mc-env.sh
 *   ```
 * - check SLIC and DST Maker
 *   ```
 *   which slic
 *   which dst_maker
 *   ```
 */