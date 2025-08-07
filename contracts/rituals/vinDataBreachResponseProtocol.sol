// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title vinDataBreachResponseProtocol
/// @author Vinvin
/// @notice A symbolic contract for logging breach events and activating protective responses
/// @dev Designed for civic dignity and digital resilience

contract vinDataBreachResponseProtocol {
    struct BreachEvent {
        string organization;
        string breachDate;
        string dataTypesExposed;
        uint256 affectedIndividuals;
        bool identityProtectionActivated;
    }

    mapping(address => BreachEvent) public breachLog;
    address public scrollcaster;

    event BreachLogged(address indexed victim, string organization, uint256 affectedCount);
    event ProtectionActivated(address indexed victim, string provider);

    modifier onlyScrollcaster() {
        require(msg.sender == scrollcaster, "Not authorized");
        _;
    }

    constructor() {
        scrollcaster = msg.sender;
    }

    /// @notice Log a breach event for a victim
    function logBreach(
        address victim,
        string memory organization,
        string memory breachDate,
        string memory dataTypesExposed,
        uint256 affectedIndividuals
    ) public onlyScrollcaster {
        breachLog[victim] = BreachEvent({
            organization: organization,
            breachDate: breachDate,
            dataTypesExposed: dataTypesExposed,
            affectedIndividuals: affectedIndividuals,
            identityProtectionActivated: false
        });

        emit BreachLogged(victim, organization, affectedIndividuals);
    }

    /// @notice Activate identity protection for a victim
    function activateProtection(address victim, string memory provider) public onlyScrollcaster {
        require(!breachLog[victim].identityProtectionActivated, "Already activated");
        breachLog[victim].identityProtectionActivated = true;

        emit ProtectionActivated(victim, provider);
    }

    /// @notice View breach details
    function getBreachDetails(address victim) public view returns (BreachEvent memory) {
        return breachLog[victim];
    }
}
