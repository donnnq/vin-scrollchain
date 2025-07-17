// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

/**
 * @title vin-scrollWrappedBTCRegistry
 * @author VINVIN + Scrollkeeper
 * @notice Records wrapped BTC interactions and upgrade intentions across the soulchain
 */

contract vinScrollWrappedBTCRegistry {
    struct WrapLog {
        address owner;
        uint256 amount;
        string purpose;
        bool upgradeIntent;
        uint256 timestamp;
    }

    event BTCWrapped(
        address indexed owner,
        uint256 amount,
        string purpose,
        bool upgradeIntent,
        uint256 timestamp
    );

    WrapLog[] public registry;

    function wrapBTC(uint256 amount, string memory purpose, bool upgradeIntent) external {
        WrapLog memory entry = WrapLog({
            owner: msg.sender,
            amount: amount,
            purpose: purpose,
            upgradeIntent: upgradeIntent,
            timestamp: block.timestamp
        });

        registry.push(entry);
        emit BTCWrapped(msg.sender, amount, purpose, upgradeIntent, block.timestamp);
    }

    function viewWrap(uint index) external view returns (WrapLog memory) {
        require(index < registry.length, "No wrapped entry at that index");
        return registry[index];
    }

    function totalWraps() external view returns (uint256) {
        return registry.length;
    }

    function lastWrappedBy(address owner) external view returns (WrapLog memory) {
        for (uint256 i = registry.length; i > 0; i--) {
            if (registry[i - 1].owner == owner) {
                return registry[i - 1];
            }
        }
        revert("No wrap record for this address");
    }
}
