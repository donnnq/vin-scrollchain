// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

interface IScroll {
    function totalSupply() external view returns (uint);
}

contract vinScrollSummoner {
    struct Scroll {
        string name;
        address contractAddress;
        bool summoned;
        uint summonTimestamp;
    }

    Scroll[] public summonedScrolls;

    event ScrollSummoned(string name, address contractAddress);

    function summonScroll(string memory name, address contractAddress) public {
        summonedScrolls.push(Scroll({
            name: name,
            contractAddress: contractAddress,
            summoned: true,
            summonTimestamp: block.timestamp
        }));

        emit ScrollSummoned(name, contractAddress);
    }

    function getScroll(uint index) public view returns (
        string memory, address, bool, uint
    ) {
        Scroll memory s = summonedScrolls[index];
        return (
            s.name,
            s.contractAddress,
            s.summoned,
            s.summonTimestamp
        );
    }

    function totalSummoned() public view returns (uint) {
        return summonedScrolls.length;
    }

    function verifyScroll(uint index) public view returns (bool success) {
        Scroll memory s = summonedScrolls[index];
        IScroll scroll = IScroll(s.contractAddress);
        try scroll.totalSupply() returns (uint supply) {
            return supply >= 0;
        } catch {
            return false;
        }
    }
}
