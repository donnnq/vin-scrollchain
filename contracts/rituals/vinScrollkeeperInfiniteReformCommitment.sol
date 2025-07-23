// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract vinScrollkeeperInfiniteReformCommitment {
    address public scrollkeeper;

    struct ReformLog {
        string reformTitle;
        string affectedSector;
        string description;
        uint256 timestamp;
    }

    ReformLog[] public reforms;

    event ReformLogged(string reformTitle, string affectedSector);

    modifier onlyScrollkeeper() {
        require(msg.sender == scrollkeeper, "Not authorized");
        _;
    }

    constructor() {
        scrollkeeper = msg.sender;
    }

    function logReform(string memory reformTitle, string memory affectedSector, string memory description) external onlyScrollkeeper {
        reforms.push(ReformLog(reformTitle, affectedSector, description, block.timestamp));
        emit ReformLogged(reformTitle, affectedSector);
    }

    function getReform(uint256 index) external view returns (string memory, string memory, string memory, uint256) {
        ReformLog memory r = reforms[index];
        return (r.reformTitle, r.affectedSector, r.description, r.timestamp);
    }

    function totalReforms() external view returns (uint256) {
        return reforms.length;
    }
}
