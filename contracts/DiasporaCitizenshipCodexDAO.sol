// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DiasporaCitizenshipCodexDAO {
    address public admin;

    struct CitizenshipEntry {
        string diasporaRegion;
        string individualID;
        string rightsGranted;
        string emotionalTag;
        bool approved;
    }

    CitizenshipEntry[] public codex;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _diasporaRegion, string memory _individualID, string memory _rightsGranted, string memory _emotionalTag) external onlyAdmin {
        codex.push(CitizenshipEntry(_diasporaRegion, _individualID, _rightsGranted, _emotionalTag, false));
    }

    function approveEntry(uint256 index) external onlyAdmin {
        codex[index].approved = true;
    }

    function getEntry(uint256 index) external view returns (CitizenshipEntry memory) {
        return codex[index];
    }
}
