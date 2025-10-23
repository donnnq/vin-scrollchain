// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CeasefireVerificationProtocol {
    address public steward;

    struct CeasefireEntry {
        string region; // "Gaza", "Southern Lebanon", "West Bank"
        string verificationSignal; // "UN observer report", "Satellite timestamp", "Ground witness log"
        string emotionalTag;
        bool verified;
        bool sealed;
    }

    CeasefireEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function verifyCeasefire(string memory region, string memory verificationSignal, string memory emotionalTag) external onlySteward {
        entries.push(CeasefireEntry(region, verificationSignal, emotionalTag, true, false));
    }

    function sealCeasefireEntry(uint256 index) external onlySteward {
        require(entries[index].verified, "Must be verified first");
        entries[index].sealed = true;
    }

    function getCeasefireEntry(uint256 index) external view returns (CeasefireEntry memory) {
        return entries[index];
    }
}
