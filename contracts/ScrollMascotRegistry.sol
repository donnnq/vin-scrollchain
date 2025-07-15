// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract ScrollMascotRegistry {
    struct Mascot {
        string name;
        string cryptoStyle;
        string element;
        string lore;
        address creator;
    }

    Mascot[] public mascots;
    mapping(address => uint256[]) public creatorToMascots;

    event MascotRegistered(string name, string cryptoStyle, address indexed creator);

    function registerMascot(
        string calldata name,
        string calldata cryptoStyle,
        string calldata element,
        string calldata lore
    ) external {
        Mascot memory m = Mascot(name, cryptoStyle, element, lore, msg.sender);
        mascots.push(m);
        creatorToMascots[msg.sender].push(mascots.length - 1);
        emit MascotRegistered(name, cryptoStyle, msg.sender);
    }

    function getMyMascots() external view returns (uint256[] memory) {
        return creatorToMascots[msg.sender];
    }

    function getMascot(uint256 index) external view returns (string memory, string memory, string memory, string memory, address) {
        Mascot memory m = mascots[index];
        return (m.name, m.cryptoStyle, m.element, m.lore, m.creator);
    }

    function totalMascots() external view returns (uint256) {
        return mascots.length;
    }
}
