-- Minlevel and multiplier are MANDATORY
-- Maxlevel is OPTIONAL, but is considered infinite by default
-- Create a stage with minlevel 1 and no maxlevel to disable stages
experienceStages = {
    {
        minlevel = 8,
        maxlevel = 100,
        multiplier = 180, -- queda mais cedo
    },
    {
        minlevel = 101,
        maxlevel = 200,
        multiplier = 120,
    },
    {
        minlevel = 201,
        maxlevel = 300,
        multiplier = 70,
    },
    {
        minlevel = 301,
        maxlevel = 400,
        multiplier = 40,
    },
    {
        minlevel = 401,
        maxlevel = 500,
        multiplier = 25,
    },
    {
        minlevel = 501,
        maxlevel = 600,
        multiplier = 15,
    },
    {
        minlevel = 601,
        maxlevel = 700,
        multiplier = 14,
    },
    {
        minlevel = 701,
        maxlevel = 800,
        multiplier = 10,
    },
    {
        minlevel = 801,
        maxlevel = 900,
        multiplier = 6,
    },
    {
        minlevel = 901,
        maxlevel = 1000,
        multiplier = 3,
    },
    {
        minlevel = 1001,
        maxlevel = 1200,
        multiplier = 2,
    },
    {
        minlevel = 1201,
        multiplier = 1, -- hard endgame
    },
}

skillsStages = {

	{
		minlevel = 1,
		maxlevel = 80,
		multiplier = 40,
	},
	{
		minlevel = 81,
		maxlevel = 100,
		multiplier = 20,
	},
	{
		minlevel = 101,
		maxlevel = 120,
		multiplier = 10,
	},
	{
		minlevel = 121,
		multiplier = 5,
	},

}

magicLevelStages = {
		
	{
		minlevel = 1,
		maxlevel = 80,
		multiplier = 20,
	},
	{
		minlevel = 81,
		maxlevel = 100,
		multiplier = 10,
	},
	{
		minlevel = 101,
		maxlevel = 120,
		multiplier = 5,
	},
	{
		minlevel = 121,
		maxlevel = 300,
		multiplier = 3,
	},
}
