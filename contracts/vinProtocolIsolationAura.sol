// SPDX-License-Identifier: Scroll-Freezer
pragma solidity ^0.8.19;

contract vinProtocolIsolationAura {
    address public sovereignNode;
    mapping(string => bool) public blacklistedRegions;
    mapping(string => uint256) public freezeTimestamp;

    event RegionBlacklisted(string region, uint256 timestamp);
    event RegionUnblacklisted(string region, uint256 timestamp);

    modifier onlySovereign() {
        require(msg.sender == sovereignNode, "Access restricted to scroll sovereign");
        _;
    }

    constructor() {
        sovereignNode = msg.sender;
    }

    function blacklistRegion(string calldata region) external onlySovereign {
        require(!blacklistedRegions[region], "Already blacklisted");
        blacklistedRegions[region] = true;
        freezeTimestamp[region] = block.timestamp;
        emit RegionBlacklisted(region, block.timestamp);
    }

    function unblacklistRegion(string calldata region) external onlySovereign {
        require(blacklistedRegions[region], "Region not blacklisted");
        blacklistedRegions[region] = false;
        freezeTimestamp[region] = 0;
        emit RegionUnblacklisted(region, block.timestamp);
    }

    function checkStatus(string calldata region) external view returns (string memory status) {
        if (blacklistedRegions[region]) {
            status = string(abi.encodePacked("❄️ Region '", region, "' is blacklisted. Frozen at timestamp: ", uint2str(freezeTimestamp[region])));
        } else {
            status = "✅ Region clear. Scroll resonance allowed.";
        }
    }

    function uint2str(uint256 _i) internal pure returns (string memory str) {
        if (_i == 0) return "0";
        uint256 j = _i;
        uint256 len;
        while (j != 0) { len++; j /= 10; }
        bytes memory bstr = new bytes(len);
        uint256 k = len;
        while (_i != 0) { k--; bstr[k] = bytes1(uint8(48 + _i % 10)); _i /= 10; }
        return string(bstr);
    }
}
