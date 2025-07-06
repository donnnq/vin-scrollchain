// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VinRitualTemple {
    struct Scroll {
        string name;
        address contractAddress;
        string purpose;
    }

    Scroll[] public scrolls;

    event ScrollEnshrined(string name, address contractAddress, string purpose, uint256 indexed index);
    event TempleVisited(address indexed visitor, uint256 timestamp);

    function enshrineScroll(
        string calldata name,
        address contractAddress,
        string calldata purpose
    ) external {
        scrolls.push(Scroll({
            name: name,
            contractAddress: contractAddress,
            purpose: purpose
        }));

        emit ScrollEnshrined(name, contractAddress, purpose, scrolls.length - 1);
    }

    function totalScrolls() external view returns (uint256) {
        return scrolls.length;
    }

    function getScroll(uint256 index) external view returns (Scroll memory) {
        require(index < scrolls.length, "Invalid scroll index");
        return scrolls[index];
    }

    function visitTemple() external {
        emit TempleVisited(msg.sender, block.timestamp);
    }
}
