pragma solidity ^0.8.0;

contract vinFocusStack {
    struct Log {
        string upgrade;
        uint256 timestamp;
    }

    Log[] public logs;
    address public creator = msg.sender;

    function recordUpgrade(string memory upgrade) external {
        require(msg.sender == creator, "Only Vinvin can forge focus");
        logs.push(Log(upgrade, block.timestamp));
    }

    function currentFocus() external view returns (string memory) {
        if (logs.length == 0) return "Focus is forming...";
        return logs[logs.length - 1].upgrade;
    }
}
