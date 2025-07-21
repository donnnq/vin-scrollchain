// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title vinOrderVeilDecoder
/// @notice Sidecar contract to decode ZK-shielded trade data from vinDarkPoolDEX.sol
/// @author VINVIN

contract vinOrderVeilDecoder {
    event VeilDecoded(
        address indexed viewer,
        uint256 decodedAt,
        string assetSymbol,
        uint256 size,
        string riskSignal
    );

    struct OrderSignal {
        string assetSymbol;
        uint256 size;
        string riskSignal;
    }

    mapping(bytes32 => OrderSignal) public decryptedOrders;

    function decodeOrder(bytes32 encryptedAsset, string calldata assetSymbol, uint256 size, string calldata riskSignal) external {
        decryptedOrders[encryptedAsset] = OrderSignal({
            assetSymbol: assetSymbol,
            size: size,
            riskSignal: riskSignal
        });

        emit VeilDecoded(msg.sender, block.timestamp, assetSymbol, size, riskSignal);
    }

    function getDecryptedOrder(bytes32 encryptedAsset) external view returns (
        string memory assetSymbol,
        uint256 size,
        string memory riskSignal
    ) {
        OrderSignal memory o = decryptedOrders[encryptedAsset];
        return (o.assetSymbol, o.size, o.riskSignal);
    }
}
