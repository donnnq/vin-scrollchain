// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TimeCardToConsentVerificationProtocol {
    address public steward;

    struct ConsentEntry {
        string workerID; // "Vinvin-Shift-001"
        string timeLogged; // "07:00 to 19:00"
        string consentStatus; // "Voluntary", "Defaulted", "Pressured"
        string verificationMethod; // "Scrollchain opt-in", "Supervisor log", "Worker portal"
        string emotionalTag;
        bool verified;
        bool sealed;
    }

    ConsentEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function verifyConsent(string memory workerID, string memory timeLogged, string memory consentStatus, string memory verificationMethod, string memory emotionalTag) external onlySteward {
        entries.push(ConsentEntry(workerID, timeLogged, consentStatus, verificationMethod, emotionalTag, true, false));
    }

    function sealConsentEntry(uint256 index) external onlySteward {
        require(entries[index].verified, "Must be verified first");
        entries[index].sealed = true;
    }

    function getConsentEntry(uint256 index) external view returns (ConsentEntry memory) {
        return entries[index];
    }
}
