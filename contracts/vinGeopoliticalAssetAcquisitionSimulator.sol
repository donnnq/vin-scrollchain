// SPDX-License-Identifier: Mythstream-Lambing
pragma solidity ^0.8.20;

contract vinGeopoliticalAssetAcquisitionSimulator {
    struct Farmland {
        string region;
        bool nearMilitaryBase;
        bool flaggedByCFIUS;
        uint256 assetKiligFactor;
    }

    mapping(address => Farmland[]) public holdings;

    event AcquisitionLogged(
        address indexed VINVIN,
        string region,
        bool nearMilitaryBase,
        bool dramaTriggered,
        uint256 assetKiligFactor
    );

    function acquireLand(
        string memory region,
        bool baseProximity,
        uint256 kiligLevel
    ) public {
        bool drama = baseProximity && kiligLevel > 777;
        Farmland memory plot = Farmland(region, baseProximity, drama, kiligLevel);
        holdings[msg.sender].push(plot);
        emit AcquisitionLogged(msg.sender, region, baseProximity, drama, kiligLevel);
    }

    function totalDramaAssets(address VINVIN) public view returns (uint256) {
        Farmland[] memory plots = holdings[VINVIN];
        uint256 dramaCount;
        for (uint256 i = 0; i < plots.length; i++) {
            if (plots[i].flaggedByCFIUS) {
                dramaCount += 1;
            }
        }
        return dramaCount;
    }
}
