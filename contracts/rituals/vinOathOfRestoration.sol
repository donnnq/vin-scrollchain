// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract vinOathOfRestoration {
    struct Oath {
        string name;
        string region;
        string vowText;
        uint timestamp;
        address soulboundID;
    }

    Oath[] public civicVows;

    event OathTaken(string name, string region);

    function takeOath(
        string memory name,
        string memory region,
        string memory vowText
    ) public {
        civicVows.push(Oath({
            name: name,
            region: region,
            vowText: vowText,
            timestamp: block.timestamp,
            soulboundID: msg.sender
        }));

        emit OathTaken(name, region);
    }

    function getOath(uint index) public view returns (
        string memory, string memory, string memory, uint, address
    ) {
        Oath memory o = civicVows[index];
        return (
            o.name,
            o.region,
            o.vowText,
            o.timestamp,
            o.soulboundID
        );
    }

    function totalOaths() public view returns (uint) {
        return civicVows.length;
    }
}
