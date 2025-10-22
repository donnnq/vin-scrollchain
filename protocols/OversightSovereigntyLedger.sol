// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract OversightSovereigntyLedger {
    address public admin;

    struct SovereigntyEntry {
        string oversightBody; // "Ombudsman", "COA"
        string sovereigntySignal; // "Mandate defense", "Funding reinforcement", "Jurisdiction clarity"
        string emotionalTag;
        bool logged;
        bool sealed;
    }

    SovereigntyEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function logSovereignty(string memory oversightBody, string memory sovereigntySignal, string memory emotionalTag) external onlyAdmin {
        entries.push(SovereigntyEntry(oversightBody, sovereigntySignal, emotionalTag, true, false));
    }

    function sealSovereigntyEntry(uint256 index) external onlyAdmin {
        require(entries[index].logged, "Must be logged first");
        entries[index].sealed = true;
    }

    function getSovereigntyEntry(uint256 index) external view returns (SovereigntyEntry memory) {
        return entries[index];
    }
}
