// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title vinSovereignPiggieBank
/// @notice Records national and state-level BTC holdings for hedging, legacy, and kilig-powered resilience
/// @author VINVIN

contract vinSovereignPiggieBank {
    event BTCReserveLogged(
        string entity,
        uint256 amountBTC,
        uint256 avgPrice,
        string classification,
        string strategyNote,
        uint256 timestamp
    );

    struct ReserveEntry {
        string entity;
        uint256 amountBTC;
        uint256 avgPrice;
        string classification; // "Nation", "State", "Corporation"
        string strategyNote;
        uint256 timestamp;
    }

    ReserveEntry[] public vault;

    function logReserve(
        string calldata entity,
        uint256 amountBTC,
        uint256 avgPrice,
        string calldata classification,
        string calldata strategyNote
    ) external {
        vault.push(ReserveEntry({
            entity: entity,
            amountBTC: amountBTC,
            avgPrice: avgPrice,
            classification: classification,
            strategyNote: strategyNote,
            timestamp: block.timestamp
        }));

        emit BTCReserveLogged(entity, amountBTC, avgPrice, classification, strategyNote, block.timestamp);
    }

    function getVaultSize() external view returns (uint256) {
        return vault.length;
    }

    function getReserveAt(uint256 index) external view returns (
        string memory entity,
        uint256 amountBTC,
        uint256 avgPrice,
        string memory classification,
        string memory strategyNote,
        uint256 timestamp
    ) {
        ReserveEntry memory r = vault[index];
        return (r.entity, r.amountBTC, r.avgPrice, r.classification, r.strategyNote, r.timestamp);
    }
}
