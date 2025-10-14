// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PlanetaryPatchDAO {
    address public admin;

    struct PatchEntry {
        string systemName;
        string vulnerabilityTag;
        string patchVersion;
        string emotionalTag;
        bool deployed;
    }

    PatchEntry[] public patches;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitPatch(string memory _systemName, string memory _vulnerabilityTag, string memory _patchVersion, string memory _emotionalTag) external onlyAdmin {
        patches.push(PatchEntry(_systemName, _vulnerabilityTag, _patchVersion, _emotionalTag, false));
    }

    function deployPatch(uint256 index) external onlyAdmin {
        patches[index].deployed = true;
    }

    function getPatch(uint256 index) external view returns (PatchEntry memory) {
        return patches[index];
    }
}
