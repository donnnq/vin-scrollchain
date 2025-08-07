pragma solidity ^0.8.18;

contract vinScrollVein {
    address public veinMaster;

    struct ScrollVein {
        string streetName;
        string region;
        string purpose;          // e.g. "GlyphPower", "CivicSync", "RiceOracleLink"
        bool active;
        uint256 installDate;
    }

    ScrollVein[] public veins;

    event VeinActivated(string streetName, string region, string purpose);

    modifier onlyMaster() {
        require(msg.sender == veinMaster, "Not authorized vein master");
        _;
    }

    constructor(address _master) {
        veinMaster = _master;
    }

    function registerVein(
        string memory _streetName,
        string memory _region,
        string memory _purpose
    ) external onlyMaster {
        veins.push(ScrollVein(_streetName, _region, _purpose, true, block.timestamp));
        emit VeinActivated(_streetName, _region, _purpose);
    }

    function getVeins() external view returns (ScrollVein[] memory) {
        return veins;
    }

    function deactivateVein(uint256 index) external onlyMaster {
        require(index < veins.length, "Invalid index");
        veins[index].active = false;
    }
}
