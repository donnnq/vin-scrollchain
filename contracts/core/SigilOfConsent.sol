// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title SigilOfConsent - Soulbound perimeter for emotional and civic boundaries
/// @notice Users declare what emotional interactions are allowed; steward must honor

contract SigilOfConsent {
    address public steward;

    enum ConsentLevel { None, JoyOnly, FullSanctuary }

    struct ConsentProfile {
        ConsentLevel level;
        string message;
        uint256 timestamp;
    }

    mapping(address => ConsentProfile) private consentLedger;

    event ConsentDeclared(address indexed user, ConsentLevel level, string message);
    event ConsentRespected(address indexed user, string action);

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not steward");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    /// @notice User declares their emotional and civic consent level
    function declareConsent(ConsentLevel _level, string memory _message) external {
        consentLedger[msg.sender] = ConsentProfile(_level, _message, block.timestamp);
        emit ConsentDeclared(msg.sender, _level, _message);
    }

    /// @notice Steward checks if action is allowed before blessing
    function verifyConsent(address _user, ConsentLevel _required) external view returns (bool) {
        ConsentProfile memory profile = consentLedger[_user];
        return uint(profile.level) >= uint(_required);
    }

    /// @notice Steward logs that consent was respected
    function logConsentRespect(address _user, string memory _action) external onlySteward {
        emit ConsentRespected(_user, _action);
    }

    /// @notice User can view their own consent profile
    function getMyConsent() external view returns (ConsentProfile memory) {
        return consentLedger[msg.sender];
    }
}
