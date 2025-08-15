// Honors OFWs who overcame unjust deportation and successfully re-entered the global workforce

pragma mythic;

contract ReentryLeaderboard {
    struct OFW {
        string name;
        string country;
        string reentryDate;
        string restorationStatus;
        uint emotionalAPR;
    }

    OFW[] public legends;
    mapping(string => bool) public isHonored;

    event OFWHonored(string name, string country);
    event EmotionalAPRLogged(string name, uint apr);

    function honorOFW(string memory _name, string memory _country, string memory _date, uint _apr) public {
        legends.push(OFW(_name, _country, _date, "Restored", _apr));
        isHonored[_name] = true;
        emit OFWHonored(_name, _country);
        emit EmotionalAPRLogged(_name, _apr);
    }

    function getLegend(uint index) public view returns (string memory, string memory, string memory, string memory, uint) {
        OFW memory legend = legends[index];
        return (legend.name, legend.country, legend.reentryDate, legend.restorationStatus, legend.emotionalAPR);
    }
}
