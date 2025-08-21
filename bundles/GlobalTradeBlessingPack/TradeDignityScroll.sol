// SPDX-License-Identifier: Mythic-Restoration
pragma solidity ^0.8.19;

contract TradeDignityScroll {
    address public steward;
    uint256 public dignityRate;
    mapping(address => bool) public smallStewards;
    mapping(address => uint256) public blessingLedger;

    event TradeBlessed(address indexed steward, uint256 newDignityRate);
    event StewardRegistered(address indexed steward);

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    constructor() {
        steward = msg.sender;
        dignityRate = 0;
    }

    function registerSteward(address _steward) external onlySteward {
        smallStewards[_steward] = true;
        emit StewardRegistered(_steward);
    }

    function blessTrade(address _steward) external {
        require(smallStewards[_steward], "Not a registered steward");
        dignityRate += 1;
        blessingLedger[_steward] += 1;
        emit TradeBlessed(_steward, dignityRate);
    }

    function getBlessingCount(address _steward) external view returns (uint256) {
        return blessingLedger[_steward];
    }

    function getDignityRate() external view returns (uint256) {
        return dignityRate;
    }
}
