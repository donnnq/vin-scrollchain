// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title vinScrollBridgeOracle
/// @notice Tracks cross-chain registry for tokenized assets and securities
/// @author VINVIN

contract vinScrollBridgeOracle {
    event CrossChainAssetLogged(
        address indexed sourceScroll,
        string originChain,
        string destinationChain,
        string assetType,
        string bridgeMethod,
        uint256 timestamp
    );

    event BridgeStatusUpdated(
        bytes32 indexed transferId,
        string status,
        uint256 timestamp
    );

    struct BridgeEntry {
        address sourceScroll;
        string originChain;
        string destinationChain;
        string assetType;
        string bridgeMethod;
        uint256 timestamp;
    }

    mapping(bytes32 => string) public bridgeStatus;
    BridgeEntry[] public bridgeLogs;

    function logCrossChainTransfer(
        address scroll,
        string calldata originChain,
        string calldata destinationChain,
        string calldata assetType,
        string calldata method
    ) external returns (bytes32 transferId) {
        transferId = keccak256(abi.encodePacked(scroll, block.timestamp, originChain, destinationChain));
        bridgeStatus[transferId] = "Pending";

        bridgeLogs.push(BridgeEntry({
            sourceScroll: scroll,
            originChain: originChain,
            destinationChain: destinationChain,
            assetType: assetType,
            bridgeMethod: method,
            timestamp: block.timestamp
        }));

        emit CrossChainAssetLogged(scroll, originChain, destinationChain, assetType, method, block.timestamp);
    }

    function updateBridgeStatus(bytes32 transferId, string calldata newStatus) external {
        bridgeStatus[transferId] = newStatus;
        emit BridgeStatusUpdated(transferId, newStatus, block.timestamp);
    }

    function getBridgeCount() external view returns (uint256) {
        return bridgeLogs.length;
    }

    function getBridgeAt(uint256 index) external view returns (
        address sourceScroll,
        string memory originChain,
        string memory destinationChain,
        string memory assetType,
        string memory bridgeMethod,
        uint256 timestamp
    ) {
        BridgeEntry memory b = bridgeLogs[index];
        return (b.sourceScroll, b.originChain, b.destinationChain, b.assetType, b.bridgeMethod, b.timestamp);
    }
}
