// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract vinDependencySanctifier {
    struct DependencyLog {
        string packageName;
        string oldVersion;
        string newVersion;
        string reason; // e.g. "Security patch", "Performance", "Scroll purity"
        string advisoryLink;
        uint256 timestamp;
    }

    DependencyLog[] public logs;
    address public scrollkeeper;

    event DependencySanctified(
        string packageName,
        string oldVersion,
        string newVersion,
        string reason,
        string advisoryLink,
        uint256 timestamp
    );

    modifier onlyScrollkeeper() {
        require(msg.sender == scrollkeeper, "Only Scrollkeeper may sanctify dependencies");
        _;
    }

    constructor() {
        scrollkeeper = msg.sender;
    }

    function sanctifyUpgrade(
        string memory _packageName,
        string memory _oldVersion,
        string memory _newVersion,
        string memory _reason,
        string memory _advisoryLink
    ) public onlyScrollkeeper {
        logs.push(DependencyLog(
            _packageName,
            _oldVersion,
            _newVersion,
            _reason,
            _advisoryLink,
            block.timestamp
        ));

        emit DependencySanctified(
            _packageName,
            _oldVersion,
            _newVersion,
            _reason,
            _advisoryLink,
            block.timestamp
        );
    }

    function getLog(uint256 index) public view returns (DependencyLog memory) {
        require(index < logs.length, "Invalid index");
        return logs[index];
    }

    function getLogCount() public view returns (uint256) {
        return logs.length;
    }
}
