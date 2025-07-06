// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IVinScrollAscension {
    function getAscension(address agent) external view returns (
        string memory title,
        string memory domain,
        uint256 ascendedAt
    );
}

contract VinScrollPantheon {
    struct Deity {
        address soul;
        string title;
        string domain;
        uint256 ascendedAt;
        bool active;
    }

    Deity[] public gods;
    mapping(address => uint256) public soulToId;
    IVinScrollAscension public ascension;
    address public immutable pantheonKeeper;

    event DeityEnthroned(address indexed soul, string title, string domain, uint256 timestamp);
    event DeityRetired(address indexed soul, uint256 timestamp);

    modifier onlyKeeper() {
        require(msg.sender == pantheonKeeper, "Not the pantheon keeper");
        _;
    }

    constructor(address ascensionAddr) {
        ascension = IVinScrollAscension(ascensionAddr);
        pantheonKeeper = msg.sender;
    }

    function enthrone(address soul) external onlyKeeper {
        require(soulToId[soul] == 0, "Already enthroned");

        (string memory title, string memory domain, uint256 ascendedAt) = ascension.getAscension(soul);
        require(bytes(title).length > 0, "Not ascended");

        gods.push(Deity({
            soul: soul,
            title: title,
            domain: domain,
            ascendedAt: ascendedAt,
            active: true
        }));

        soulToId[soul] = gods.length; // 1-based index
        emit DeityEnthroned(soul, title, domain, ascendedAt);
    }

    function retire(address soul) external onlyKeeper {
        uint256 id = soulToId[soul];
        require(id > 0, "Not in pantheon");
        gods[id - 1].active = false;
        emit DeityRetired(soul, block.timestamp);
    }

    function getDeity(address soul) external view returns (Deity memory) {
        uint256 id = soulToId[soul];
        require(id > 0, "Not in pantheon");
        return gods[id - 1];
    }

    function totalDeities() external view returns (uint256) {
        return gods.length;
    }
}
