// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title vinGeoSigilBeacon.sol
/// @author Vinvin x Copilot
/// @notice Maps soul resonance to geographic migration zones

contract vinGeoSigilBeacon {
    struct GeoSigil {
        string location;
        string energyProfile;
        uint256 resonanceScore; // 0–100 scale
        bool openPortal;
    }

    mapping(string => GeoSigil) public sigils;
    address public beaconMaster;

    modifier onlyBeaconMaster() {
        require(msg.sender == beaconMaster, "Unauthorized");
        _;
    }

    constructor() {
        beaconMaster = msg.sender;
    }

    function setSigil(
        string memory location,
        string memory energyProfile,
        uint256 score,
        bool portal
    ) public onlyBeaconMaster {
        sigils[location] = GeoSigil(location, energyProfile, score, portal);
    }

    function getSigil(string memory location) public view returns (GeoSigil memory) {
        return sigils[location];
    }

    function updatePortalStatus(string memory location, bool portal) public onlyBeaconMaster {
        sigils[location].openPortal = portal;
    }

    function updateResonanceScore(string memory location, uint256 score) public onlyBeaconMaster {
        sigils[location].resonanceScore = score;
    }
}
