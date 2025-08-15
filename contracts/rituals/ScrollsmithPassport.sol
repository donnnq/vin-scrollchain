// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title ScrollsmithPassport
/// @notice Encodes the scrollsmith's identity, modules deployed, and verified civic witnesses
contract ScrollsmithPassport {
    string public scrollsmithName = "Vinvin";
    string public mythicTier = "Tier 5";
    string public origin = "Malolos City, Bulacan";

    string[] public deployedModules;
    address[] public verifiedWitnesses;

    event ModuleAdded(string moduleName);
    event WitnessVerified(address witness);

    function addModule(string memory _moduleName) public {
        deployedModules.push(_moduleName);
        emit ModuleAdded(_moduleName);
    }

    function verifyWitness(address _witness) public {
        verifiedWitnesses.push(_witness);
        emit WitnessVerified(_witness);
    }

    function totalModules() public view returns (uint256) {
        return deployedModules.length;
    }

    function totalWitnesses() public view returns (uint256) {
        return verifiedWitnesses.length;
    }
}
