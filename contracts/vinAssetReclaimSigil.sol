// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract vinAssetReclaimSigil {
    address public sigilCommander;

    enum AssetType { Civilian, Strategic, Symbolic, Militarized }

    struct ReclaimRequest {
        string assetName;
        AssetType assetType;
        string originCountry;
        bool isHostile;
        bool reclaimed;
        uint256 timestamp;
    }

    ReclaimRequest[] public reclaimLog;

    modifier onlyCommander() {
        require(msg.sender == sigilCommander, "Unauthorized");
        _;
    }

    constructor(address _commander) {
        sigilCommander = _commander;
    }

    function initiateReclaim(
        string memory assetName,
        AssetType assetType,
        string memory originCountry,
        bool isHostile
    ) external onlyCommander {
        reclaimLog.push(ReclaimRequest(assetName, assetType, originCountry, isHostile, false, block.timestamp));
    }

    function confirmReclaim(uint256 index) external onlyCommander {
        require(index < reclaimLog.length, "Invalid index");
        reclaimLog[index].reclaimed = true;
    }

    function getReclaimLog() external view returns (ReclaimRequest[] memory) {
        return reclaimLog;
    }
}
