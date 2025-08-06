// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract vinRiskZoneAlert {
    address public alertAdmin;

    struct AssetStatus {
        string assetName;
        string currentCountry;
        uint256 lastChecked;
        bool isInRiskZone;
    }

    mapping(string => AssetStatus) public assetMap;
    string[] public riskZones;

    modifier onlyAdmin() {
        require(msg.sender == alertAdmin, "Unauthorized");
        _;
    }

    constructor(address _admin) {
        alertAdmin = _admin;
        riskZones = ["Russia", "China", "North Korea"];
    }

    function updateAssetLocation(string memory assetName, string memory country) external onlyAdmin {
        bool risk = isRiskZone(country);
        assetMap[assetName] = AssetStatus(assetName, country, block.timestamp, risk);
    }

    function isRiskZone(string memory country) public view returns (bool) {
        for (uint i = 0; i < riskZones.length; i++) {
            if (keccak256(bytes(riskZones[i])) == keccak256(bytes(country))) {
                return true;
            }
        }
        return false;
    }

    function getAssetStatus(string memory assetName) external view returns (AssetStatus memory) {
        return assetMap[assetName];
    }
}
