// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract vinScrollOfEmploymentSanctity {
    address public sanctifier;
    mapping(address => bool) public verifiedEmployers;
    mapping(string => bool) public blacklistedNationCodes;
    mapping(bytes32 => bool) public flaggedIdentities;

    event EmployerVerified(address indexed employer);
    event IdentityFlagged(bytes32 indexed identityHash, string reason);
    event NationBlacklisted(string countryCode, string justification);

    modifier onlySanctifier() {
        require(msg.sender == sanctifier, "Not scroll guardian");
        _;
    }

    constructor() {
        sanctifier = msg.sender;
    }

    function verifyEmployer(address employer) external onlySanctifier {
        verifiedEmployers[employer] = true;
        emit EmployerVerified(employer);
    }

    function flagIdentity(bytes32 identityHash, string memory reason) external onlySanctifier {
        flaggedIdentities[identityHash] = true;
        emit IdentityFlagged(identityHash, reason);
    }

    function blacklistNation(string memory countryCode, string memory justification) external onlySanctifier {
        blacklistedNationCodes[countryCode] = true;
        emit NationBlacklisted(countryCode, justification);
    }

    function isNationBlacklisted(string memory countryCode) external view returns (bool) {
        return blacklistedNationCodes[countryCode];
    }
}
