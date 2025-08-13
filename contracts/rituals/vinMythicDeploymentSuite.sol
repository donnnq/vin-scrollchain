// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "./vinTreatyForge.sol";
import "./vinSignalEcho.sol";
import "./vinFleetBlessing.sol";

contract vinMythicDeploymentSuite {
    vinTreatyForge public treatyForge;
    vinSignalEcho public signalEcho;
    vinFleetBlessing public fleetBlessing;

    constructor(
        address _treatyForge,
        address _signalEcho,
        address _fleetBlessing
    ) {
        treatyForge = vinTreatyForge(_treatyForge);
        signalEcho = vinSignalEcho(_signalEcho);
        fleetBlessing = vinFleetBlessing(_fleetBlessing);
    }

    function deployMythicFleet(
        string memory treatyTitle,
        string[] memory allies,
        string memory purpose,
        string memory hostileOrigin,
        string memory distortionType,
        uint256 intensity,
        string memory fleetName,
        string memory region,
        string memory invocation
    ) public {
        treatyForge.forgeTreaty(treatyTitle, allies, purpose);
        signalEcho.bounceSignal(hostileOrigin, distortionType, intensity);
        fleetBlessing.blessFleet(fleetName, region, invocation);
    }
}
