// SPDX-License-Identifier: Scrollkeeper-Exposure
pragma solidity ^0.8.19;

contract vinTradeBlacklistRenderer {
    struct BlacklistedEntity {
        address entity;
        string nation;
        string reason;
        uint timestamp;
    }

    BlacklistedEntity[] public blacklist;

    event EntityBlacklisted(address entity, string nation, string reason);

    function blacklistEntity(address entity, string memory nation, string memory reason) public {
        blacklist.push(BlacklistedEntity(entity, nation, reason, block.timestamp));
        emit EntityBlacklisted(entity, nation, reason);
    }

    function getBlacklist() public view returns (BlacklistedEntity[] memory) {
        return blacklist;
    }
}
