contract vinHarvestToHeavenRenderer {
    struct RegionBlessing {
        string region;
        uint256 fertilityIndex;
        uint256 recentHarvestCount;
        string ritualPhrase;
        uint256 timestamp;
    }

    RegionBlessing[] public blessings;

    event BlessingRendered(string region, string ritualPhrase);

    function renderBlessing(string memory _region, uint256 _fertility, uint256 _harvestCount, string memory _phrase) public {
        blessings.push(RegionBlessing(_region, _fertility, _harvestCount, _phrase, block.timestamp));
        emit BlessingRendered(_region, _phrase);
    }

    function viewBlessings() public view returns (RegionBlessing[] memory) {
        return blessings;
    }
}
