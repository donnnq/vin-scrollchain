// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract ScrollRemixRegistry {
    struct Remix {
        string moduleName;
        string description;
        string version;
        uint256 timestamp;
        address contributor;
    }

    Remix[] public remixes;
    mapping(address => uint256[]) public contributorToRemixes;

    event RemixLogged(string moduleName, string version, address indexed contributor);

    function logRemix(
        string calldata moduleName,
        string calldata description,
        string calldata version
    ) external {
        Remix memory r = Remix(moduleName, description, version, block.timestamp, msg.sender);
        remixes.push(r);
        contributorToRemixes[msg.sender].push(remixes.length - 1);
        emit RemixLogged(moduleName, version, msg.sender);
    }

    function getMyRemixes() external view returns (uint256[] memory) {
        return contributorToRemixes[msg.sender];
    }

    function getRemix(uint256 index) external view returns (string memory, string memory, string memory, uint256, address) {
        Remix memory r = remixes[index];
        return (r.moduleName, r.description, r.version, r.timestamp, r.contributor);
    }

    function totalRemixes() external view returns (uint256) {
        return remixes.length;
    }
}
