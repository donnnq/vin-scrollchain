// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract ScrollOfDataVulnerabilityMapping {
    struct BreachEvent {
        string platformName;
        uint256 affectedUsers;
        string dataTypesExposed;
        uint256 breachDate;
        string remediationStatus;
    }

    mapping(uint256 => BreachEvent) public breachLog;
    uint256 public breachCount;

    event BreachLogged(
        string platformName,
        uint256 affectedUsers,
        string dataTypesExposed,
        uint256 breachDate,
        string remediationStatus
    );

    function logBreach(
        string memory _platformName,
        uint256 _affectedUsers,
        string memory _dataTypesExposed,
        uint256 _breachDate,
        string memory _remediationStatus
    ) public {
        breachCount++;
        breachLog[breachCount] = BreachEvent(
            _platformName,
            _affectedUsers,
            _dataTypesExposed,
            _breachDate,
            _remediationStatus
        );
        emit BreachLogged(_platformName, _affectedUsers, _dataTypesExposed, _breachDate, _remediationStatus);
    }
}
