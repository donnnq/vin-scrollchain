// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "./vinDataBreachResponseProtocol.sol";
import "./vinPhishingAlertBeacon.sol";
import "./vinIdentityRestorationSigil.sol";

/// @title vinDigitalDignityTrilogy
/// @notice Unified interface for breach response, phishing alerts, and identity restoration
/// @dev Symbolic scroll for civic protection and emotional healing

contract vinDigitalDignityTrilogy {
    vinDataBreachResponseProtocol public breachProtocol;
    vinPhishingAlertBeacon public phishingBeacon;
    vinIdentityRestorationSigil public restorationSigil;

    address public scrollcaster;

    constructor(
        address _breachProtocol,
        address _phishingBeacon,
        address _restorationSigil
    ) {
        scrollcaster = msg.sender;
        breachProtocol = vinDataBreachResponseProtocol(_breachProtocol);
        phishingBeacon = vinPhishingAlertBeacon(_phishingBeacon);
        restorationSigil = vinIdentityRestorationSigil(_restorationSigil);
    }

    modifier onlyScrollcaster() {
        require(msg.sender == scrollcaster, "Not authorized");
        _;
    }

    /// @notice Log full breach + alert + restoration in one ritual
    function fullTrilogyRitual(
        address victim,
        string memory organization,
        string memory breachDate,
        string memory dataTypesExposed,
        uint256 affectedIndividuals,
        string memory phishingSource,
        string memory phishingMethod,
        string memory phishingSample,
        bool policeReportFiled,
        bool creditFrozen,
        bool insuranceClaimSubmitted,
        uint256 claimAmount,
        string memory status
    ) public onlyScrollcaster {
        breachProtocol.logBreach(victim, organization, breachDate, dataTypesExposed, affectedIndividuals);
        phishingBeacon.broadcastAlert(victim, phishingSource, phishingMethod, phishingSample);
        restorationSigil.updateRestoration(victim, policeReportFiled, creditFrozen, insuranceClaimSubmitted, claimAmount, status);
    }
}
