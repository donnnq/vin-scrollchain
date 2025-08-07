// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract vinAssetSanctuaryTransfer {
    address public scrollArchitect;

    struct AssetRecord {
        string assetName;
        string originCountry;
        string destinationCountry;
        uint256 transferTimestamp;
        bool transferred;
    }

    AssetRecord[] public assetLog;

    event AssetTransferInitiated(string assetName, string originCountry, string destinationCountry);
    event AssetTransferConfirmed(string assetName, string destinationCountry);

    modifier onlyArchitect() {
        require(msg.sender == scrollArchitect, "Unauthorized");
        _;
    }

    constructor(address _architect) {
        scrollArchitect = _architect;
    }

    function initiateTransfer(string memory assetName, string memory originCountry, string memory destinationCountry) external onlyArchitect {
        assetLog.push(AssetRecord(assetName, originCountry, destinationCountry, block.timestamp, false));
        emit AssetTransferInitiated(assetName, originCountry, destinationCountry);
    }

    function confirmTransfer(uint256 assetIndex) external onlyArchitect {
        require(assetIndex < assetLog.length, "Invalid index");
        assetLog[assetIndex].transferred = true;
        emit AssetTransferConfirmed(assetLog[assetIndex].assetName, assetLog[assetIndex].destinationCountry);
    }

    function getAssetLog() external view returns (AssetRecord[] memory) {
        return assetLog;
    }
}
