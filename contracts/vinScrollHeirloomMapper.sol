// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract vinScrollHeirloomMapper {
    struct Heirloom {
        string scrollTitle;
        string ancestorScroll;
        uint timestamp;
    }

    Heirloom[] public lineage;
    event HeirloomLinked(string scrollTitle, string ancestorScroll);

    function linkHeirloom(string memory scrollTitle, string memory ancestorScroll) public {
        lineage.push(Heirloom(scrollTitle, ancestorScroll, block.timestamp));
        emit HeirloomLinked(scrollTitle, ancestorScroll);
    }

    function getLineage() public view returns (Heirloom[] memory) {
        return lineage;
    }
}
