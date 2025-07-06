// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VinScrollkeeperV2 {
    enum ScrollStatus { Casted, Used, Expired }

    struct ScrollLog {
        address caster;
        address to;
        uint256 scrollId;
        ScrollStatus status;
        uint256 timestamp;
        string note;
    }

    ScrollLog[] public logs;

    event ScrollCasted(address indexed caster, address indexed to, uint256 scrollId, string note);
    event ScrollUsed(address indexed user, uint256 scrollId, string note);
    event ScrollExpired(uint256 scrollId, string reason);

    function logCast(address to, uint256 scrollId, string calldata note) external {
        logs.push(ScrollLog({
            caster: msg.sender,
            to: to,
            scrollId: scrollId,
            status: ScrollStatus.Casted,
            timestamp: block.timestamp,
            note: note
        }));

        emit ScrollCasted(msg.sender, to, scrollId, note);
    }

    function logUse(uint256 scrollId, string calldata note) external {
        logs.push(ScrollLog({
            caster: msg.sender,
            to: msg.sender,
            scrollId: scrollId,
            status: ScrollStatus.Used,
            timestamp: block.timestamp,
            note: note
        }));

        emit ScrollUsed(msg.sender, scrollId, note);
    }

    function logExpire(uint256 scrollId, string calldata reason) external {
        logs.push(ScrollLog({
            caster: msg.sender,
            to: address(0),
            scrollId: scrollId,
            status: ScrollStatus.Expired,
            timestamp: block.timestamp,
            note: reason
        }));

        emit ScrollExpired(scrollId, reason);
    }

    function totalLogs() external view returns (uint256) {
        return logs.length;
    }

    function getLog(uint256 index) external view returns (ScrollLog memory) {
        require(index < logs.length, "Invalid log index");
        return logs[index];
    }
}
