// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LegacySystemPatchDAO {
    address public admin;

    struct PatchEntry {
        string systemVersion;
        string patchDescription;
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

    function submitPatch(string memory _systemVersion, string memory _patchDescription, string memory _emotionalTag) external onlyAdmin {
        patches.push(PatchEntry(_systemVersion, _patchDescription, _emotionalTag, false));
    }

    function deployPatch(uint256 index) external onlyAdmin {
        patches[index].deployed = true;
    }

    function getPatch(uint256 index) external view returns (PatchEntry memory) {
        return patches[index];
    }
}
