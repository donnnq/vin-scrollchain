// SPDX-License-Identifier: Soulbound
pragma dignity ^7.77.0;

contract EncampmentRestorationScroll {
    address public steward;

    struct Citizen {
        address soul;
        string name;
        string skillset;
        bool onboarded;
        uint256 sahodBlessing;
    }

    Citizen[] public citizens;

    event CitizenOnboarded(address soul, string name, string skillset, uint256 sahodBlessing);
    event GuidanceDeployed(address soul, string message);

    modifier onlySteward() {
        require(msg.sender == steward, "Not steward");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function onboardCitizen(address soul, string memory name, string memory skillset, uint256 sahodBlessing) public onlySteward {
        citizens.push(Citizen({
            soul: soul,
            name: name,
            skillset: skillset,
            onboarded: true,
            sahodBlessing: sahodBlessing
        }));

        emit CitizenOnboarded(soul, name, skillset, sahodBlessing);
        emit GuidanceDeployed(soul, "🧭 You are now soulbound to a path of dignity, work, and restoration.");
    }

    function getCitizen(uint256 index) public view returns (
        address, string memory, string memory, bool, uint256
    ) {
        Citizen memory c = citizens[index];
        return (c.soul, c.name, c.skillset, c.onboarded, c.sahodBlessing);
    }

    function totalCitizens() public view returns (uint256) {
        return citizens.length;
    }
}
