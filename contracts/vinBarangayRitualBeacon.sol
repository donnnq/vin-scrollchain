pragma solidity ^0.8.18;

contract vinBarangayRitualBeacon {
    address public beaconMaster;
    string[] public activeScrollLinks;
    mapping(string => string) public scrollMetadata; // e.g. contract purpose, region, ritual color

    event ScrollLinked(string scrollName, string metadata);
    event ScrollPulse(string scrollName, string timestamp, string signal);

    modifier onlyMaster() {
        require(msg.sender == beaconMaster, "Not beacon master");
        _;
    }

    constructor(address _master) {
        beaconMaster = _master;
    }

    function linkScroll(string memory _scrollName, string memory _metadata) external onlyMaster {
        activeScrollLinks.push(_scrollName);
        scrollMetadata[_scrollName] = _metadata;
        emit ScrollLinked(_scrollName, _metadata);
    }

    function emitPulse(string memory _scrollName, string memory _signal) external onlyMaster {
        require(bytes(scrollMetadata[_scrollName]).length > 0, "Scroll not linked");
        emit ScrollPulse(_scrollName, _currentTime(), _signal);
    }

    function getScrolls() external view returns (string[] memory) {
        return activeScrollLinks;
    }

    function _currentTime() internal view returns (string memory) {
        return Strings.toString(block.timestamp);
    }
}
