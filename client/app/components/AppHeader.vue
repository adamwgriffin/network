<template>
  <header class="z-10 flex items-end gap-24 p-6 sticky top-0 bg-default">
    <NuxtLink to="/">
      <NetworkLogo class="fill-blue-400 dark:fill-blue-200" />
      <p class="pt-1 text-right text-xs text-blue-400 dark:text-blue-200">
        The premier social network for TV doctors
      </p>
    </NuxtLink>
    <nav>
      <ul class="flex gap-6">
        <li>
          <NavLink icon-name="lucide-lab:house" to="/">Home</NavLink>
        </li>
        <li>
          <NavLink icon-name="lucide:users" to="/mynetwork">My Network</NavLink>
        </li>
        <li>
          <UserMenu />
        </li>
      </ul>
    </nav>
  </header>
</template>
