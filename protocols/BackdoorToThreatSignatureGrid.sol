// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BackdoorToThreatSignatureGrid {
    address public steward;

    struct SignatureEntry {
        string backdoorName; // "Brickstorm"
        string threatType; // "Stealth malware", "Persistence exploit"
        string detectionMethod; // "Scrollchain signature", "CERT alert", "Vendor patch"
        string emotionalTag;
        bool registered;
        bool sealed;
    }

    SignatureEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function registerSignature(string memory backdoorName, string memory threatType, string memory detectionMethod, string memory emotionalTag) external onlySteward {
        entries.push(SignatureEntry(backdoorName, threatType, detectionMethod, emotionalTag, true, false));
    }

    function sealSignatureEntry(uint256 index) external onlySteward {
        require(entries[index].registered, "Must be registered first");
        entries[index].sealed = true;
    }

    function getSignatureEntry(uint256 index) external view returns (SignatureEntry memory) {
        return entries[index];
    }
}
